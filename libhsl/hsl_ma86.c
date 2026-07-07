/* ---------------------------------------------------------------------- */
/* HSL MA86                                                               */
/* ---------------------------------------------------------------------- */

void ma86_default_control_d(void* control) {
  (void)control;
}

void ma86_analyse_d(const int n, const int ptr[], const int row[], int order[],
                    void** keep, const void* control, void* info) {
  (void)n; (void)ptr; (void)row; (void)order;
  (void)keep; (void)control; (void)info;
}

void ma86_factor_d(const int n, const int ptr[], const int row[], const double val[],
                   const int order[], void** keep, const void* control, void* info,
                   const double scale[]) {
  (void)n; (void)ptr; (void)row; (void)val; (void)order;
  (void)keep; (void)control; (void)info; (void)scale;
}

void ma86_solve_d(const int job, const int nrhs, const int ldx, double* x,
                  const int order[], void** keep, const void* control, void* info,
                  const double scale[]) {
  (void)job; (void)nrhs; (void)ldx; (void)x; (void)order;
  (void)keep; (void)control; (void)info; (void)scale;
}

void ma86_finalise_d(void** keep, const void* control) {
  (void)keep; (void)control;
}

/* ---------------------------------------------------------------------- */
/* HSL MC68                                                               */
/* ---------------------------------------------------------------------- */

void mc68_default_control_i(void* control) {
  (void)control;
}

void mc68_order_i(const int ord, const int n, const int ptr[], const int row[],
                  int perm[], const void* control, void* info) {
  (void)ord; (void)n; (void)ptr; (void)row;
  (void)perm; (void)control; (void)info;
}
