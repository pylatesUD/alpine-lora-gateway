extern void my_qsort_r(void* base_, size_t nmemb, size_t size, int (*compar)(const void*, const void*, void*), void* thunk);
#define qsort_r(p,nmem,size,cmp,arg) my_qsort_r(p,nmem,size,cmp,arg)
