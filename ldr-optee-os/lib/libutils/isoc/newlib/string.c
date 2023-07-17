#include <string.h>

/**
 * strspn - Calculate the length of the initial substring of @s 
 * which only contain letters in @accept
 * @s:		The string to be searched
 * @accept:	The string to search for
 */
size_t strspn(const char *s, const char *accept)
{
	const char *p;
	const char *a;
	size_t count = 0;

	for (p = s; *p != '\0'; ++p) {
		for (a = accept; *a != '\0'; ++a) {
			if (*p == *a)
				break;
		}
		if (*a == '\0')
			return count;
		++count;
	}
	return count;
}

/**
 * strcspn - Calculate the length of the initial substring of @s 
 * which does not contain letters in @reject
 * @s:		The string to be searched
 * @reject:	The string to avoid
 */
size_t strcspn(const char *s, const char *reject)
{
	const char *p;
	const char *r;
	size_t count = 0;

	for (p = s; *p != '\0'; ++p) {
		for (r = reject; *r != '\0'; ++r) {
			if (*p == *r)
				return count;
		}
		++count;
	}
	return count;
} 