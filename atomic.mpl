"atomic" module
"control" includeModule

refCast: [
  ref: schema:;;
  ref storageAddress @ref isConst [schema] [@schema] uif addressToReference
] func;

ACQUIRE: {MEMORY_ORDER: {}; virtual ORDER: "acquire";};
RELEASE: {MEMORY_ORDER: {}; virtual ORDER: "release";};

{ref: Nat8  Ref; value: Nat8 ;} Nat8  {} "atomicExchangeN8Acquire"  importFunction
{ref: Nat16 Ref; value: Nat16;} Nat16 {} "atomicExchangeN16Acquire" importFunction
{ref: Nat32 Ref; value: Nat32;} Nat32 {} "atomicExchangeN32Acquire" importFunction
{ref: Nat64 Ref; value: Nat64;} Nat64 {} "atomicExchangeN64Acquire" importFunction
{ref: Nat8  Ref; value: Nat8 ;} Nat8  {} "atomicExchangeN8Release"  importFunction
{ref: Nat16 Ref; value: Nat16;} Nat16 {} "atomicExchangeN16Release" importFunction
{ref: Nat32 Ref; value: Nat32;} Nat32 {} "atomicExchangeN32Release" importFunction
{ref: Nat64 Ref; value: Nat64;} Nat64 {} "atomicExchangeN64Release" importFunction

{ref: Nat8  Cref;} Nat8  {} "atomicLoadN8Acquire"  importFunction
{ref: Nat16 Cref;} Nat16 {} "atomicLoadN16Acquire" importFunction
{ref: Nat32 Cref;} Nat32 {} "atomicLoadN32Acquire" importFunction
{ref: Nat64 Cref;} Nat64 {} "atomicLoadN64Acquire" importFunction

{ref: Nat8  Ref; value: Nat8 ;} Nat8  {} "atomicOrN8Acquire"  importFunction
{ref: Nat16 Ref; value: Nat16;} Nat16 {} "atomicOrN16Acquire" importFunction
{ref: Nat32 Ref; value: Nat32;} Nat32 {} "atomicOrN32Acquire" importFunction
{ref: Nat64 Ref; value: Nat64;} Nat64 {} "atomicOrN64Acquire" importFunction
{ref: Nat8  Ref; value: Nat8 ;} Nat8  {} "atomicOrN8Release"  importFunction
{ref: Nat16 Ref; value: Nat16;} Nat16 {} "atomicOrN16Release" importFunction
{ref: Nat32 Ref; value: Nat32;} Nat32 {} "atomicOrN32Release" importFunction
{ref: Nat64 Ref; value: Nat64;} Nat64 {} "atomicOrN64Release" importFunction

{ref: Nat8  Ref; value: Nat8 ;} {} {} "atomicStoreN8Release"  importFunction
{ref: Nat16 Ref; value: Nat16;} {} {} "atomicStoreN16Release" importFunction
{ref: Nat32 Ref; value: Nat32;} {} {} "atomicStoreN32Release" importFunction
{ref: Nat64 Ref; value: Nat64;} {} {} "atomicStoreN64Release" importFunction

{ref: Nat8  Ref; value: Nat8 ;} Nat8  {} "atomicXorN8Acquire"  importFunction
{ref: Nat16 Ref; value: Nat16;} Nat16 {} "atomicXorN16Acquire" importFunction
{ref: Nat32 Ref; value: Nat32;} Nat32 {} "atomicXorN32Acquire" importFunction
{ref: Nat64 Ref; value: Nat64;} Nat64 {} "atomicXorN64Acquire" importFunction
{ref: Nat8  Ref; value: Nat8 ;} Nat8  {} "atomicXorN8Release"  importFunction
{ref: Nat16 Ref; value: Nat16;} Nat16 {} "atomicXorN16Release" importFunction
{ref: Nat32 Ref; value: Nat32;} Nat32 {} "atomicXorN32Release" importFunction
{ref: Nat64 Ref; value: Nat64;} Nat64 {} "atomicXorN64Release" importFunction

atomicExchange: [0 .Invalid_parameters] func;
atomicExchange: [value: ref: order:;;; value Int8  same ref Int8  same and order ACQUIRE same and] [drop value: ref:;; value Nat8  cast @ref Nat8  refCast atomicExchangeN8Acquire ] pfunc;
atomicExchange: [value: ref: order:;;; value Int16 same ref Int16 same and order ACQUIRE same and] [drop value: ref:;; value Nat16 cast @ref Nat16 refCast atomicExchangeN16Acquire] pfunc;
atomicExchange: [value: ref: order:;;; value Int32 same ref Int32 same and order ACQUIRE same and] [drop value: ref:;; value Nat32 cast @ref Nat32 refCast atomicExchangeN32Acquire] pfunc;
atomicExchange: [value: ref: order:;;; value Int64 same ref Int64 same and order ACQUIRE same and] [drop value: ref:;; value Nat64 cast @ref Nat64 refCast atomicExchangeN64Acquire] pfunc;
atomicExchange: [value: ref: order:;;; value Nat8  same ref Nat8  same and order ACQUIRE same and] [drop atomicExchangeN8Acquire ] pfunc;
atomicExchange: [value: ref: order:;;; value Nat16 same ref Nat16 same and order ACQUIRE same and] [drop atomicExchangeN16Acquire] pfunc;
atomicExchange: [value: ref: order:;;; value Nat32 same ref Nat32 same and order ACQUIRE same and] [drop atomicExchangeN32Acquire] pfunc;
atomicExchange: [value: ref: order:;;; value Nat64 same ref Nat64 same and order ACQUIRE same and] [drop atomicExchangeN64Acquire] pfunc;
atomicExchange: [value: ref: order:;;; value Int8  same ref Int8  same and order RELEASE same and] [drop value: ref:;; value Nat8  cast @ref Nat8  refCast atomicExchangeN8Release ] pfunc;
atomicExchange: [value: ref: order:;;; value Int16 same ref Int16 same and order RELEASE same and] [drop value: ref:;; value Nat16 cast @ref Nat16 refCast atomicExchangeN16Release] pfunc;
atomicExchange: [value: ref: order:;;; value Int32 same ref Int32 same and order RELEASE same and] [drop value: ref:;; value Nat32 cast @ref Nat32 refCast atomicExchangeN32Release] pfunc;
atomicExchange: [value: ref: order:;;; value Int64 same ref Int64 same and order RELEASE same and] [drop value: ref:;; value Nat64 cast @ref Nat64 refCast atomicExchangeN64Release] pfunc;
atomicExchange: [value: ref: order:;;; value Nat8  same ref Nat8  same and order RELEASE same and] [drop atomicExchangeN8Release ] pfunc;
atomicExchange: [value: ref: order:;;; value Nat16 same ref Nat16 same and order RELEASE same and] [drop atomicExchangeN16Release] pfunc;
atomicExchange: [value: ref: order:;;; value Nat32 same ref Nat32 same and order RELEASE same and] [drop atomicExchangeN32Release] pfunc;
atomicExchange: [value: ref: order:;;; value Nat64 same ref Nat64 same and order RELEASE same and] [drop atomicExchangeN64Release] pfunc;

atomicLoad: [0 .Invalid_parameters] func;
atomicLoad: [ref: order:;; ref Int8  same order ACQUIRE same and] [drop Nat8  refCast atomicLoadN8Acquire ] pfunc;
atomicLoad: [ref: order:;; ref Int16 same order ACQUIRE same and] [drop Nat16 refCast atomicLoadN16Acquire] pfunc;
atomicLoad: [ref: order:;; ref Int32 same order ACQUIRE same and] [drop Nat32 refCast atomicLoadN32Acquire] pfunc;
atomicLoad: [ref: order:;; ref Int64 same order ACQUIRE same and] [drop Nat64 refCast atomicLoadN64Acquire] pfunc;
atomicLoad: [ref: order:;; ref Nat8  same order ACQUIRE same and] [drop atomicLoadN8Acquire ] pfunc;
atomicLoad: [ref: order:;; ref Nat16 same order ACQUIRE same and] [drop atomicLoadN16Acquire] pfunc;
atomicLoad: [ref: order:;; ref Nat32 same order ACQUIRE same and] [drop atomicLoadN32Acquire] pfunc;
atomicLoad: [ref: order:;; ref Nat64 same order ACQUIRE same and] [drop atomicLoadN64Acquire] pfunc;

atomicOr: [0 .Invalid_parameters] func;
atomicOr: [value: ref: order:;;; value Int8  same ref Int8  same and order ACQUIRE same and] [drop value: ref:;; value Nat8  cast @ref Nat8  refCast atomicOrN8Acquire ] pfunc;
atomicOr: [value: ref: order:;;; value Int16 same ref Int16 same and order ACQUIRE same and] [drop value: ref:;; value Nat16 cast @ref Nat16 refCast atomicOrN16Acquire] pfunc;
atomicOr: [value: ref: order:;;; value Int32 same ref Int32 same and order ACQUIRE same and] [drop value: ref:;; value Nat32 cast @ref Nat32 refCast atomicOrN32Acquire] pfunc;
atomicOr: [value: ref: order:;;; value Int64 same ref Int64 same and order ACQUIRE same and] [drop value: ref:;; value Nat64 cast @ref Nat64 refCast atomicOrN64Acquire] pfunc;
atomicOr: [value: ref: order:;;; value Nat8  same ref Nat8  same and order ACQUIRE same and] [drop atomicOrN8Acquire ] pfunc;
atomicOr: [value: ref: order:;;; value Nat16 same ref Nat16 same and order ACQUIRE same and] [drop atomicOrN16Acquire] pfunc;
atomicOr: [value: ref: order:;;; value Nat32 same ref Nat32 same and order ACQUIRE same and] [drop atomicOrN32Acquire] pfunc;
atomicOr: [value: ref: order:;;; value Nat64 same ref Nat64 same and order ACQUIRE same and] [drop atomicOrN64Acquire] pfunc;
atomicOr: [value: ref: order:;;; value Int8  same ref Int8  same and order RELEASE same and] [drop value: ref:;; value Nat8  cast @ref Nat8  refCast atomicOrN8Release ] pfunc;
atomicOr: [value: ref: order:;;; value Int16 same ref Int16 same and order RELEASE same and] [drop value: ref:;; value Nat16 cast @ref Nat16 refCast atomicOrN16Release] pfunc;
atomicOr: [value: ref: order:;;; value Int32 same ref Int32 same and order RELEASE same and] [drop value: ref:;; value Nat32 cast @ref Nat32 refCast atomicOrN32Release] pfunc;
atomicOr: [value: ref: order:;;; value Int64 same ref Int64 same and order RELEASE same and] [drop value: ref:;; value Nat64 cast @ref Nat64 refCast atomicOrN64Release] pfunc;
atomicOr: [value: ref: order:;;; value Nat8  same ref Nat8  same and order RELEASE same and] [drop atomicOrN8Release ] pfunc;
atomicOr: [value: ref: order:;;; value Nat16 same ref Nat16 same and order RELEASE same and] [drop atomicOrN16Release] pfunc;
atomicOr: [value: ref: order:;;; value Nat32 same ref Nat32 same and order RELEASE same and] [drop atomicOrN32Release] pfunc;
atomicOr: [value: ref: order:;;; value Nat64 same ref Nat64 same and order RELEASE same and] [drop atomicOrN64Release] pfunc;

atomicStore: [0 .Invalid_parameters] func;
atomicStore: [value: ref: order:;;; value Int8  same ref Int8  same and order RELEASE same and] [drop value: ref:;; value Nat8  cast @ref Nat8  refCast atomicStoreN8Release ] pfunc;
atomicStore: [value: ref: order:;;; value Int16 same ref Int16 same and order RELEASE same and] [drop value: ref:;; value Nat16 cast @ref Nat16 refCast atomicStoreN16Release] pfunc;
atomicStore: [value: ref: order:;;; value Int32 same ref Int32 same and order RELEASE same and] [drop value: ref:;; value Nat32 cast @ref Nat32 refCast atomicStoreN32Release] pfunc;
atomicStore: [value: ref: order:;;; value Int64 same ref Int64 same and order RELEASE same and] [drop value: ref:;; value Nat64 cast @ref Nat64 refCast atomicStoreN64Release] pfunc;
atomicStore: [value: ref: order:;;; value Nat8  same ref Nat8  same and order RELEASE same and] [drop atomicStoreN8Release ] pfunc;
atomicStore: [value: ref: order:;;; value Nat16 same ref Nat16 same and order RELEASE same and] [drop atomicStoreN16Release] pfunc;
atomicStore: [value: ref: order:;;; value Nat32 same ref Nat32 same and order RELEASE same and] [drop atomicStoreN32Release] pfunc;
atomicStore: [value: ref: order:;;; value Nat64 same ref Nat64 same and order RELEASE same and] [drop atomicStoreN64Release] pfunc;

atomicXor: [0 .Invalid_parameters] func;
atomicXor: [value: ref: order:;;; value Int8  same ref Int8  same and order ACQUIRE same and] [drop value: ref:;; value Nat8  cast @ref Nat8  refCast atomicXorN8Acquire ] pfunc;
atomicXor: [value: ref: order:;;; value Int16 same ref Int16 same and order ACQUIRE same and] [drop value: ref:;; value Nat16 cast @ref Nat16 refCast atomicXorN16Acquire] pfunc;
atomicXor: [value: ref: order:;;; value Int32 same ref Int32 same and order ACQUIRE same and] [drop value: ref:;; value Nat32 cast @ref Nat32 refCast atomicXorN32Acquire] pfunc;
atomicXor: [value: ref: order:;;; value Int64 same ref Int64 same and order ACQUIRE same and] [drop value: ref:;; value Nat64 cast @ref Nat64 refCast atomicXorN64Acquire] pfunc;
atomicXor: [value: ref: order:;;; value Nat8  same ref Nat8  same and order ACQUIRE same and] [drop atomicXorN8Acquire ] pfunc;
atomicXor: [value: ref: order:;;; value Nat16 same ref Nat16 same and order ACQUIRE same and] [drop atomicXorN16Acquire] pfunc;
atomicXor: [value: ref: order:;;; value Nat32 same ref Nat32 same and order ACQUIRE same and] [drop atomicXorN32Acquire] pfunc;
atomicXor: [value: ref: order:;;; value Nat64 same ref Nat64 same and order ACQUIRE same and] [drop atomicXorN64Acquire] pfunc;
atomicXor: [value: ref: order:;;; value Int8  same ref Int8  same and order RELEASE same and] [drop value: ref:;; value Nat8  cast @ref Nat8  refCast atomicXorN8Release ] pfunc;
atomicXor: [value: ref: order:;;; value Int16 same ref Int16 same and order RELEASE same and] [drop value: ref:;; value Nat16 cast @ref Nat16 refCast atomicXorN16Release] pfunc;
atomicXor: [value: ref: order:;;; value Int32 same ref Int32 same and order RELEASE same and] [drop value: ref:;; value Nat32 cast @ref Nat32 refCast atomicXorN32Release] pfunc;
atomicXor: [value: ref: order:;;; value Int64 same ref Int64 same and order RELEASE same and] [drop value: ref:;; value Nat64 cast @ref Nat64 refCast atomicXorN64Release] pfunc;
atomicXor: [value: ref: order:;;; value Nat8  same ref Nat8  same and order RELEASE same and] [drop atomicXorN8Release ] pfunc;
atomicXor: [value: ref: order:;;; value Nat16 same ref Nat16 same and order RELEASE same and] [drop atomicXorN16Release] pfunc;
atomicXor: [value: ref: order:;;; value Nat32 same ref Nat32 same and order RELEASE same and] [drop atomicXorN32Release] pfunc;
atomicXor: [value: ref: order:;;; value Nat64 same ref Nat64 same and order RELEASE same and] [drop atomicXorN64Release] pfunc;
