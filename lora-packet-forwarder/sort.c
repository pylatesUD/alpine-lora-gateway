#define _GNU_SOURCE
#include <stdlib.h>
#include "sort.h"

#ifdef NO_QSORT_R
/* qsort_r() implementation taken from github.com/stevengj/nlopt */
/* MIT license */

/* swap size bytes between a_ and b_ */
static void
swap(void *a_, void *b_, size_t size)
{
  if (a_ == b_) return;
  {
    size_t i, nlong = size / sizeof(long);
    long *a = (long *) a_, *b = (long *) b_;
    for (i = 0; i < nlong; ++i) {
      long c = a[i];
      a[i] = b[i];
      b[i] = c;
    }
    a_ = (void*) (a + nlong);
    b_ = (void*) (b + nlong);
  }
  {
    size_t i;
    char *a = (char *) a_, *b = (char *) b_;
    size = size % sizeof(long);
    for (i = 0; i < size; ++i) {
      char c = a[i];
      a[i] = b[i];
      b[i] = c;
    }
  }
}

void
my_qsort_r(void* base_, size_t nmemb, size_t size,
           int (*compar)(const void*, const void*, void*), void* thunk)
{
  char *base = (char *) base_;
  
  if (nmemb < 10) { /* use O(nmemb^2) algorithm for small enough nmemb */
    size_t i, j;
    for (i = 0; i+1 < nmemb; ++i)
      for (j = i+1; j < nmemb; ++j)
        if (compar(base+i*size, base+j*size, thunk) > 0)
          swap(base+i*size, base+j*size, size);
  }
  else {
    size_t i, pivot, npart;
    /* pick median of first/middle/last elements as pivot */
    {
      const char *a = base, *b = base + (nmemb/2)*size, 
        *c = base + (nmemb-1)*size;
      pivot = compar(a,b,thunk) < 0
        ? (compar(b,c,thunk) < 0 ? nmemb/2 :
           (compar(a,c,thunk) < 0 ? nmemb-1 : 0))
        : (compar(a,c,thunk) < 0 ? 0 :
           (compar(b,c,thunk) < 0 ? nmemb-1 : nmemb/2));
    }
    /* partition array */
    swap(base + pivot*size, base + (nmemb-1) * size, size);
    pivot = (nmemb - 1) * size;
    for (i = npart = 0; i < nmemb-1; ++i)
      if (compar(base+i*size, base+pivot, thunk) <= 0)
        swap(base+i*size, base+(npart++)*size, size);
    swap(base+npart*size, base+pivot, size);
    /* recursive sort of two partitions */
    my_qsort_r(base, npart, size, compar, thunk);
    npart++; /* don't need to sort pivot */
    my_qsort_r(base+npart*size, nmemb-npart, size, compar, thunk);
  }
}
#endif

