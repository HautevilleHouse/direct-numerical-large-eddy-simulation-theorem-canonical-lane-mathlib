import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean.SGSModelClosure

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean

structure EnergyBudgetBalance {N : NavierStokesScalesPackage}
    {G : FilteredNSGovernor N} {S : SGSModelClosure G} where
  resolvedKineticEnergy : Prop
  subgridKineticEnergy : Prop
  dissipationRate : Prop
  energyTransfer : Prop
  conservationLaw : Prop

structure EnergyBudgetBalanceEvidence {N : NavierStokesScalesPackage}
    {G : FilteredNSGovernor N} {S : SGSModelClosure G}
    (E : EnergyBudgetBalance S) where
  resolvedKineticEnergyClosed : E.resolvedKineticEnergy
  subgridKineticEnergyClosed : E.subgridKineticEnergy
  dissipationRateClosed : E.dissipationRate
  energyTransferClosed : E.energyTransfer
  conservationLawClosed : E.conservationLaw

def EnergyBudgetBalanceClosed {N : NavierStokesScalesPackage}
    {G : FilteredNSGovernor N} {S : SGSModelClosure G}
    (E : EnergyBudgetBalance S) : Prop :=
  E.resolvedKineticEnergy ∧ E.subgridKineticEnergy ∧
  E.dissipationRate ∧ E.energyTransfer ∧ E.conservationLaw

theorem energy_budget_balance_closed_from_evidence {N : NavierStokesScalesPackage}
    {G : FilteredNSGovernor N} {S : SGSModelClosure G}
    (E : EnergyBudgetBalance S) (Ev : EnergyBudgetBalanceEvidence E) :
    EnergyBudgetBalanceClosed E := by
  exact And.intro Ev.resolvedKineticEnergyClosed
    (And.intro Ev.subgridKineticEnergyClosed
      (And.intro Ev.dissipationRateClosed
        (And.intro Ev.energyTransferClosed Ev.conservationLawClosed)))

end DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean
end HautevilleHouse