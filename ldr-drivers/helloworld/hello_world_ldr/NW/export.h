#ifndef __LDR_EXPORT_H_
#define __LDR_EXPORT_H_

struct sec_ele {
	unsigned int offset;
	unsigned int size;
};


#define TOKEN_PASTE(x, y) x##y
#define CAT(x,y) TOKEN_PASTE(x,y)

#define DECLARE_SEC_ELEMENT(s, e)				\
	static const struct sec_ele CAT(_sec_ele, __COUNTER__)	\
	__attribute__((__used__))				\
	__attribute__((section(".sec_ele"), used))		\
	= { (unsigned int)&e - (unsigned int)&s, sizeof(e) }

#endif /* __LDR_EXPORT_H_ */