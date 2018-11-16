#include "plink.h"

char *
query_reg (plink_t *p, const char *iid)
{
    if (p == NULL || iid == NULL)
        return NULL;

    uint64_t i;
    char *result;
    khint_t k;

    /* Query reg hash for sample identifier */
    k = kh_get(integer, p->reg_index, iid);

    /* Store resulting reg entry */
    if (k != kh_end(p->reg_index))
    {
        i = kh_value(p->reg_index, k);
        result = strdup (p->reg[i].reg);
        return result;
    }
    else
        return NULL;
}


char *
query_pop (plink_t *p, const char *iid)
{
    if (p == NULL || iid == NULL)
        return NULL;

    uint64_t i;
    char *result;
    khint_t k;

    /* Query reg hash for sample identifier */
    k = kh_get(integer, p->reg_index, iid);

    /* Store resulting reg entry */
    if (k != kh_end(p->reg_index))
    {
        i = kh_value(p->reg_index, k);
        result = strdup (p->reg[i].pop);
        return result;
    }
    else
        return NULL;
}

double
query_cm (plink_t *p, const char *rsid)
{
    if (p == NULL || rsid == NULL)
        return 0.0;

    uint64_t i;
    double result;
    khint_t k;

    /* Query bim hash for rsid */
    k = kh_get(integer, p->bim_index, rsid);

    /* Store the resulting bim position */
    if (k != kh_end(p->bim_index))
    {
        i = kh_value(p->bim_index, k);
        result = p->bim[i].cM;
        return result;
    }
    else
        return 0.0;
}
