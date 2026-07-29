import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean

structure FilterKernelPackage where
  convolutionKernel : Type u
  commutationWithDerivatives : Prop
  localityInFrequency : Prop
  spectralCutoffConsistency : Prop

structure FilterKernelEvidence (K : FilterKernelPackage) where
  commutationWithDerivativesClosed : K.commutationWithDerivatives
  localityInFrequencyClosed : K.localityInFrequency
  spectralCutoffConsistencyClosed : K.spectralCutoffConsistency

def FilterKernelClosed (K : FilterKernelPackage) : Prop :=
  K.commutationWithDerivatives ∧ K.localityInFrequency ∧ K.spectralCutoffConsistency

theorem filter_kernel_closed_from_evidence (K : FilterKernelPackage) (E : FilterKernelEvidence K) :
    FilterKernelClosed K := by
  exact And.intro E.commutationWithDerivativesClosed
    (And.intro E.localityInFrequencyClosed E.spectralCutoffConsistencyClosed)

end DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean
end HautevilleHouse
