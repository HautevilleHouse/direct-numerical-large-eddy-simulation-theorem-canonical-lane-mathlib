import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean

structure TurbulenceKineticEnergyPackage where
  sgsKineticEnergy : Prop
  productionTerm : Prop
  dissipationTerm : Prop
  transportTerm : Prop
  transportEquationClosed : Prop

structure TurbulenceKineticEnergyEvidence (T : TurbulenceKineticEnergyPackage) where
  sgsKineticEnergyClosed : T.sgsKineticEnergy
  productionTermClosed : T.productionTerm
  dissipationTermClosed : T.dissipationTerm
  transportTermClosed : T.transportTerm
  transportEquationClosedClosed : T.transportEquationClosed

def TurbulenceKineticEnergyClosed (T : TurbulenceKineticEnergyPackage) : Prop :=
  T.sgsKineticEnergy ∧ T.productionTerm ∧ T.dissipationTerm ∧
  T.transportTerm ∧ T.transportEquationClosed

theorem turbulence_kinetic_energy_closed_from_evidence (T : TurbulenceKineticEnergyPackage)
    (E : TurbulenceKineticEnergyEvidence T) : TurbulenceKineticEnergyClosed T := by
  exact And.intro E.sgsKineticEnergyClosed
    (And.intro E.productionTermClosed
      (And.intro E.dissipationTermClosed
        (And.intro E.transportTermClosed E.transportEquationClosedClosed)))

end DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean
end HautevilleHouse
