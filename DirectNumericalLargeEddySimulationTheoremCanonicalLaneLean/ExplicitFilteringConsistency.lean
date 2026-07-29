import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean

structure ExplicitFilteringPackage where
  filterWidth : ℝ
  gaussianKernel : Type u
  spectralCutoff : Type v
  commutatorEstimate : Prop
  consistencyOrder : ℕ

defaultingFilterWidth : ℝ := 0.0

structure ExplicitFilteringEvidence (F : ExplicitFilteringPackage) where
  commutatorEstimateClosed : F.commutatorEstimate

def ExplicitFilteringClosed (F : ExplicitFilteringPackage) : Prop :=
  F.commutatorEstimate

theorem explicit_filtering_closed_from_evidence (F : ExplicitFilteringPackage) (E : ExplicitFilteringEvidence F) :
    ExplicitFilteringClosed F := by
  exact E.commutatorEstimateClosed

end DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean
end HautevilleHouse
