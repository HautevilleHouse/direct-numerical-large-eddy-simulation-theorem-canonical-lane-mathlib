import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean

structure NavierStokesLES where
  velocityField : Type u
  pressureField : Type u
  filteredNavierStokes : Prop
  subgridScaleStress : Type v
  closureModel : Prop
  filteredNavierStokesTerm : filteredNavierStokes
  closureModelTerm : closureModel

structure NavierStokesLESEvidence (NS : NavierStokesLES) where
  filteredNavierStokesClosed : NS.filteredNavierStokes
  closureModelClosed : NS.closureModel

def NavierStokesLESClosed (NS : NavierStokesLES) : Prop :=
  NS.filteredNavierStokes ∧ NS.closureModel

theorem navier_stokes_les_closed_from_evidence (NS : NavierStokesLES)
    (E : NavierStokesLESEvidence NS) : NavierStokesLESClosed NS := by
  exact And.intro E.filteredNavierStokesClosed E.closureModelClosed

end DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean
end HautevilleHouse