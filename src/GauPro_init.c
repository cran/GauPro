// Created using tools::package_native_routine_registration_skeleton(".", character_only = FALSE)

#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* FIXME:
Check these declarations against the C/Fortran source code.
*/

/* .Call calls */
extern SEXP _GauPro_cholC(SEXP);
extern SEXP _GauPro_corr_gauss_matrix_sym_armaC(SEXP, SEXP);
extern SEXP _GauPro_corr_gauss_matrix_symC(SEXP, SEXP);
extern SEXP _GauPro_corr_gauss_matrixC(SEXP, SEXP, SEXP);
// extern SEXP _GauPro_corr_gauss_matrixCpar(SEXP, SEXP, SEXP);
extern SEXP _GauPro_corr_gauss_matrixvecC(SEXP, SEXP, SEXP);
extern SEXP _GauPro_deviance_fngr_joint(SEXP, SEXP, SEXP);
extern SEXP _GauPro_deviance_fngr_nug(SEXP, SEXP, SEXP);
extern SEXP _GauPro_deviance_fngr_theta(SEXP, SEXP, SEXP);
extern SEXP _GauPro_deviance_grad_joint(SEXP, SEXP, SEXP, SEXP);
extern SEXP _GauPro_deviance_grad_nug(SEXP, SEXP, SEXP, SEXP);
extern SEXP _GauPro_deviance_grad_theta(SEXP, SEXP, SEXP, SEXP);
extern SEXP _GauPro_deviance_part(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP _GauPro_devianceC(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP _GauPro_Gaussian_deviance_part(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP _GauPro_Gaussian_devianceC(SEXP, SEXP, SEXP, SEXP);
extern SEXP _GauPro_Gaussian_hessianCC(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP _GauPro_pred_cov(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP _GauPro_pred_meanC(SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP _GauPro_pred_meanC_mumat(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP _GauPro_pred_meanC_mumat_fast(SEXP, SEXP, SEXP, SEXP);
extern SEXP _GauPro_pred_var(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP _GauPro_rcpp_hello_world();
extern SEXP _GauPro_solveC(SEXP, SEXP);
extern SEXP _GauPro_corr_exponential_matrix_symC(SEXP, SEXP);
extern SEXP _GauPro_corr_exponential_matrixC(SEXP, SEXP, SEXP);
extern SEXP _GauPro_corr_exponential_matrixvecC(SEXP, SEXP, SEXP);
extern SEXP _GauPro_corr_matern32_matrix_symC(SEXP, SEXP);
extern SEXP _GauPro_corr_matern32_matrixC(SEXP, SEXP, SEXP);
extern SEXP _GauPro_corr_matern32_matrixvecC(SEXP, SEXP, SEXP);
extern SEXP _GauPro_corr_matern52_matrix_symC(SEXP, SEXP);
extern SEXP _GauPro_corr_matern52_matrixC(SEXP, SEXP, SEXP);
extern SEXP _GauPro_corr_matern52_matrixvecC(SEXP, SEXP, SEXP);
extern SEXP _GauPro_kernel_gauss_dC(SEXP, SEXP, SEXP, SEXP, SEXP, SEXP, SEXP);
extern SEXP _GauPro_corr_gauss_dCdX(SEXP, SEXP, SEXP, SEXP);
extern SEXP _GauPro_gradfuncarray(SEXP, SEXP, SEXP);
extern SEXP _GauPro_corr_gauss_matrix_armaC(SEXP, SEXP, SEXP, SEXP);
extern SEXP _GauPro_arma_mult_cube_vec(SEXP, SEXP);

static const R_CallMethodDef CallEntries[] = {
  {"_GauPro_cholC",                       (DL_FUNC) &_GauPro_cholC,                       1},
  {"_GauPro_corr_gauss_matrix_sym_armaC", (DL_FUNC) &_GauPro_corr_gauss_matrix_sym_armaC, 2},
  {"_GauPro_corr_gauss_matrix_symC",      (DL_FUNC) &_GauPro_corr_gauss_matrix_symC,      2},
  {"_GauPro_corr_gauss_matrixC",          (DL_FUNC) &_GauPro_corr_gauss_matrixC,          3},
  // {"_GauPro_corr_gauss_matrixCpar",    (DL_FUNC) &_GauPro_corr_gauss_matrixCpar,       3},
  {"_GauPro_corr_gauss_matrixvecC",       (DL_FUNC) &_GauPro_corr_gauss_matrixvecC,       3},
  {"_GauPro_deviance_fngr_joint",         (DL_FUNC) &_GauPro_deviance_fngr_joint,         3},
  {"_GauPro_deviance_fngr_nug",           (DL_FUNC) &_GauPro_deviance_fngr_nug,           3},
  {"_GauPro_deviance_fngr_theta",         (DL_FUNC) &_GauPro_deviance_fngr_theta,         3},
  {"_GauPro_deviance_grad_joint",         (DL_FUNC) &_GauPro_deviance_grad_joint,         4},
  {"_GauPro_deviance_grad_nug",           (DL_FUNC) &_GauPro_deviance_grad_nug,           4},
  {"_GauPro_deviance_grad_theta",         (DL_FUNC) &_GauPro_deviance_grad_theta,         4},
  {"_GauPro_deviance_part",               (DL_FUNC) &_GauPro_deviance_part,               5},
  {"_GauPro_devianceC",                   (DL_FUNC) &_GauPro_devianceC,                   5},
  {"_GauPro_Gaussian_deviance_part",      (DL_FUNC) &_GauPro_Gaussian_deviance_part,      5},
  {"_GauPro_Gaussian_devianceC",          (DL_FUNC) &_GauPro_Gaussian_devianceC,          4},
  {"_GauPro_Gaussian_hessianCC",          (DL_FUNC) &_GauPro_Gaussian_hessianCC,          6},
  {"_GauPro_pred_cov",                    (DL_FUNC) &_GauPro_pred_cov,                    6},
  {"_GauPro_pred_meanC",                  (DL_FUNC) &_GauPro_pred_meanC,                  5},
  {"_GauPro_pred_meanC_mumat",            (DL_FUNC) &_GauPro_pred_meanC_mumat,            6},
  {"_GauPro_pred_meanC_mumat_fast",       (DL_FUNC) &_GauPro_pred_meanC_mumat_fast,       4},
  {"_GauPro_pred_var",                    (DL_FUNC) &_GauPro_pred_var,                    6},
  {"_GauPro_rcpp_hello_world",            (DL_FUNC) &_GauPro_rcpp_hello_world,            0},
  {"_GauPro_solveC",                      (DL_FUNC) &_GauPro_solveC,                      2},
  {"_GauPro_corr_exponential_matrix_symC",      (DL_FUNC) &_GauPro_corr_exponential_matrix_symC,      2},
  {"_GauPro_corr_exponential_matrixC",          (DL_FUNC) &_GauPro_corr_exponential_matrixC,          3},
  {"_GauPro_corr_exponential_matrixvecC",       (DL_FUNC) &_GauPro_corr_exponential_matrixvecC,       3},
  {"_GauPro_corr_matern32_matrix_symC",      (DL_FUNC) &_GauPro_corr_matern32_matrix_symC,      2},
  {"_GauPro_corr_matern32_matrixC",          (DL_FUNC) &_GauPro_corr_matern32_matrixC,          3},
  {"_GauPro_corr_matern32_matrixvecC",       (DL_FUNC) &_GauPro_corr_matern32_matrixvecC,       3},
  {"_GauPro_corr_matern52_matrix_symC",      (DL_FUNC) &_GauPro_corr_matern52_matrix_symC,      2},
  {"_GauPro_corr_matern52_matrixC",          (DL_FUNC) &_GauPro_corr_matern52_matrixC,          3},
  {"_GauPro_corr_matern52_matrixvecC",       (DL_FUNC) &_GauPro_corr_matern52_matrixvecC,       3},
  {"_GauPro_kernel_gauss_dC",       (DL_FUNC) &_GauPro_kernel_gauss_dC,       7},
  {"_GauPro_corr_gauss_dCdX",             (DL_FUNC) &_GauPro_corr_gauss_dCdX,       4},
  {"_GauPro_gradfuncarray",               (DL_FUNC) &_GauPro_gradfuncarray,         3},
  {"_GauPro_corr_gauss_matrix_armaC",          (DL_FUNC) &_GauPro_corr_gauss_matrix_armaC,          4},
  {"_GauPro_arma_mult_cube_vec",          (DL_FUNC) &_GauPro_arma_mult_cube_vec,          2},
  {NULL, NULL, 0}
};

void R_init_GauPro(DllInfo *dll)
{
  R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
  R_useDynamicSymbols(dll, FALSE);
}
