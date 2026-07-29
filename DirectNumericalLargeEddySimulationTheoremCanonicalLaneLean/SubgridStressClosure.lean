import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean

structure SubgridStressPackage where
  resolvedStress : Type u
  crossStress : Type v
  reynoldsStress : Type w
  leonardStress : Type x
  scaleSimilarityModel : Prop
  dynamicProcedure : Prop

structure SubgridStressEvidence (S : SubgridStressPackage) where
  scaleSimilarityModelClosed : S.scaleSimilarityModel
  dynamicProcedureClosed : S.dynamicProcedure

def SubgridStressClosed (S : SubgridStressPackage) : Prop :=
  S.scaleSimilarityModel ∧ S.dynamicProcedure

theorem subgrid_stress_closed_from_evidence (S : SubgridStressPackage) (E : SubgridStressEvidence S) :
    SubgridStressClosed S := by
  exact And.intro E.scaleSimilarityModelClosed E.dynamicProcedureClosed

end DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean
end HautevilleHouse
