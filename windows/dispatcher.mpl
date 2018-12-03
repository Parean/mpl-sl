"dispatcher" module
"String" includeModule
"kernel32" includeModule
"ws2_32" useModule

dispatcher: {
  OnCallback: [{context: Natx;} {} {} codeRef] func;
  OnEventRef: [{context: Natx; numberOfBytesTransferred: Nat32; error: Nat32;} {} {} codeRef] func;

  Context: [{
    overlapped: kernel32.OVERLAPPED;
    onEvent: OnEventRef;
    context: Natx;
  }] func;

  DIE: [
    winsock2.WSACleanup 0 = ~ [("LEAK: WSACleanup failed, result=" winsock2.WSAGetLastError LF) assembleString print] when
    completionPort kernel32.CloseHandle 1 = ~ [("LEAK: CloseHandle failed, result=" kernel32.GetLastError LF) assembleString print] when
  ];

  init: [
    0n32 0nx 0nx kernel32.INVALID_HANDLE_VALUE kernel32.CreateIoCompletionPort !completionPort completionPort 0nx = [
      ("FATAL: CreateIoCompletionPort failed, result=" kernel32.GetLastError LF) assembleString print 1 exit
    ] when

    wsaData: winsock2.WSADATA; result: @wsaData 0x0202n16 winsock2.WSAStartup; result 0 = ~ [
      ("FATAL: WSAStartup failed, result=" result LF) assembleString print 1 exit
    ] when
  ] func;

  dispatch: [
    entry: kernel32.OVERLAPPED_ENTRY;
    actual: Nat32;
    1 kernel32.INFINITE @actual 1n32 @entry completionPort kernel32.GetQueuedCompletionStatusEx 1 = ~ [
      error: kernel32.GetLastError;
      ("FATAL: GetQueuedCompletionStatusEx failed, result=" error LF) assembleString print 1 exit
    ] [
      [actual 1n32 =] "unexpected actual entry count" assert
      entry.lpCompletionKey 0nx = [
        [entry.dwNumberOfBytesTransferred entry.lpOverlapped.InternalHigh Nat32 cast =] "unexpected transferred size" assert
        context: entry.lpOverlapped storageAddress Context addressToReference;
        entry.dwNumberOfBytesTransferred entry.lpOverlapped.Internal Nat32 cast context.context context.onEvent
      ] [
        entry.lpOverlapped storageAddress entry.lpCompletionKey {context: Natx;} {} {} codeRef addressToReference call
      ] if
    ] if
  ] func;

  post: [
    context: callback:;;
    [@callback isNil ~] "dispatcher.post: invalid callback" assert
    context kernel32.OVERLAPPED addressToReference @callback storageAddress 0n32 completionPort kernel32.PostQueuedCompletionStatus 1 = ~ [
      ("FATAL: PostQueuedCompletionStatus failed, result=" kernel32.GetLastError LF) assembleString print 1 exit
    ] when
  ] func;

  wakeOne: [
    nop: OnCallback;
    [drop] !nop
    0nx @nop post
  ] func;

  completionPort: Natx;
};

@dispatcher.init
