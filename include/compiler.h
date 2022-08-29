#ifndef _COMPILER_H_
#define _COMPILER_H_

#define __aligned(x)		__attribute__((__aligned__(x)))
#define __page_aligned		__aligned(PAGE_SIZE)
#define __packed		__attribute__((__packed__))
#define __noinline		__attribute__((noinline))
#define hidden 			__attribute__((__visibility__("hidden")))

#endif

