import canonicalLaneMathlib.AdmissibleClass

/-!
# Subgrid Stress Model Package

This module defines the subgrid stress model used in Large Eddy Simulation.
-/

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean

structure SubgridStressPackage where
  stressTensor : Type
  eddyViscosityModel : Prop
  similarityModel : Prop
  mixedModel : Prop

structure SubgridStressEvidence (S : SubgridStressPackage) where
  eddyViscosityModelClosed : S.eddyViscosityModel
  similarityModelClosed : S.similarityModel
  mixedModelClosed : S.mixedModel

def SubgridStressClosed (S : SubgridStressPackage) : Prop :=
  S.eddyViscosityModel ∧ S.similarityModel ∧ S.mixedModel

theorem subgrid_stress_closed_from_evidence (S : SubgridStressPackage) (E : SubgridStressEvidence S) :
    SubgridStressClosed S := by
  exact And.intro E.eddyViscosityModelClosed
    (And.intro E.similarityModelClosed E.mixedModelClosed)

end DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean
end HautevilleHouse
