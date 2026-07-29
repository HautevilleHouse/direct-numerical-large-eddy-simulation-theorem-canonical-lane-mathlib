import canonicalLaneMathlib.AdmissibleClass

/-!
# Filter Kernel Convolution Package

This module defines the filter kernel operations used in Large Eddy Simulation.
-/

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean

structure FilterKernelPackage where
  kernelFunction : Type
  convolutionOperation : Type
  commutationWithDerivatives : Prop
  positivity : Prop
  normalization : Prop

structure FilterKernelEvidence (F : FilterKernelPackage) where
  commutationWithDerivativesClosed : F.commutationWithDerivatives
  positivityClosed : F.positivity
  normalizationClosed : F.normalization

def FilterKernelClosed (F : FilterKernelPackage) : Prop :=
  F.commutationWithDerivatives ∧ F.positivity ∧ F.normalization

theorem filter_kernel_closed_from_evidence (F : FilterKernelPackage) (E : FilterKernelEvidence F) :
    FilterKernelClosed F := by
  exact And.intro E.commutationWithDerivativesClosed
    (And.intro E.positivityClosed E.normalizationClosed)

end DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean
end HautevilleHouse
