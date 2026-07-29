import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean.EnergyBudgetBalance

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean

structure LESConvergenceRate {N : NavierStokesScalesPackage}
    {G : FilteredNSGovernor N} {S : SGSModelClosure G}
    {E : EnergyBudgetBalance S} where
  errorEstimate : Prop
  convergenceOrder : Prop
  gridResolutionCondition : Prop
  filterToGridRatio : Prop

theorem les_convergence_rate_theorem {N : NavierStokesScalesPackage}
    {G : FilteredNSGovernor N} {S : SGSModelClosure G}
    {E : EnergyBudgetBalance S} (L : LESConvergenceRate E) :
    L.errorEstimate ∧ L.convergenceOrder ∧
    L.gridResolutionCondition ∧ L.filterToGridRatio := by
  exact ⟨L.errorEstimate, L.convergenceOrder, L.gridResolutionCondition, L.filterToGridRatio⟩

end DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean
end HautevilleHouse