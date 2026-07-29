import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean

structure FilteringOperator where
  filterKernel : Type u
  cutoffScale : ℝ
  homogeneousFilter : Prop
  commutingWithDerivatives : Prop
  homogeneousFilterTerm : homogeneousFilter
  commutingWithDerivativesTerm : commutingWithDerivatives

structure FilteringOperatorEvidence (F : FilteringOperator) where
  homogeneousFilterClosed : F.homogeneousFilter
  commutingWithDerivativesClosed : F.commutingWithDerivatives

def FilteringOperatorClosed (F : FilteringOperator) : Prop :=
  F.homogeneousFilter ∧ F.commutingWithDerivatives

theorem filtering_operator_closed_from_evidence (F : FilteringOperator)
    (E : FilteringOperatorEvidence F) : FilteringOperatorClosed F := by
  exact And.intro E.homogeneousFilterClosed E.commutingWithDerivativesClosed

end DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean
end HautevilleHouse