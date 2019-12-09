#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "pbwtmaster.h"

int pbwt_coancestry(cmd_t *c)
{
    int v = 0;
    size_t i = 0;
    size_t j = 0;
    double **cmatrix = NULL;
    pbwt_t *b = NULL;

    /* Read in the pbwt file from disk */
    b = pbwt_read(c->instub);
    if (b == NULL)
    {
        fprintf(stderr, "pbwtmaster [ERROR]: cannot read data from %s\n", c->instub);
        return -1;
    }

    /* Uncompress the haplotype data */
    pbwt_uncompress(b);

    /* Initialize coancestry matrix */
    cmatrix = (double **)malloc(b->nsam * sizeof(double *));
    if (cmatrix == NULL)
    {
        fputs("pbwtmaster [ERROR]: memory allocation error", stderr);
        return -1;
    }
    for (i = 0; i < b->nsam; ++i)
    {
        cmatrix[i] = (double *)malloc(b->nsam * sizeof(double));
        if (cmatrix[i] == NULL)
        {
            fputs("pbwtmaster [ERROR]: memory allocation error", stderr);
            return -1;
        }
        memset(cmatrix[i], 0, b->nsam * sizeof(double));
    }

    /* Find matches */
    v = pbwt_set_match(b, c->minlen);
    if (v < 0)
    {
        fputs("pbwtmaster [ERROR]: error retrieving matches", stderr);
        return -1;
    }

    /* Fill coancestry matrix */
    match_search(b, b->match, cmatrix, 0, b->nsite);

    /* Print coancestry matrix to STDOUT */
    for (i = 0; i < b->nsam; ++i)
    {
        for (j = 0; j < b->nsam - 1; ++j)
        {
            printf("%1.4lf\t", cmatrix[i][j]);
        }
        printf("%1.4lf\n", cmatrix[i][j]);
    }

    /* Clean up allocated memory */
    pbwt_destroy(b);
    for (i = 0; i < b->nsam; ++i)
    {
        free(cmatrix[i]);
    }
    free(cmatrix);
    free(c->query);
    free(c);

    return 0;
}
