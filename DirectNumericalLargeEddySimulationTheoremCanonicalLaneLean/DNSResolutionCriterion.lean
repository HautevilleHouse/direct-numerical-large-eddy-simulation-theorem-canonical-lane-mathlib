import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean.LESConvergenceRate

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean

structure DNSResolutionCriterion {N : NavierStokesScalesPackage}
    {G : FilteredNSGovernor N} {S : SGSModelClosure G}
    {E : EnergyBudgetBalance S} {L : LESConvergenceRate E} where
  gridSpacingH : ℝ
  kolmogorovScaleη : ℝ
  resolutionCondition : gridSpacingH ≤ kolmogorovScaleη
  nyquistCriterion : Prop
  aliasingControl : Prop

structure DNSResolutionCriterionEvidence {N : NavierStokesScalesPackage}
    {G : FilteredNSGovernor N} {S : SGSModelClosure G}
    {E : EnergyBudgetBalance S} {L : LESConvergenceRate E}
    (D : DNSResolutionCriterion L) where
  resolutionConditionClosed : D.resolutionCondition
  nyquistCriterionClosed : D.nyquistCriterion
  aliasingControlClosed : D.aliasingControl

def DNSResolutionCriterionClosed {N : NavierStokesScalesPackage}
    {G : FilteredNSGovernor N} {S : SGSModelClosure G}
    {E : EnergyBudgetBalance S} {L : LESConvergenceRate E}
    (D : DNSResolutionCriterion L) : Prop :=
  D.resolutionCondition ∧ D.nyquistCriterion ∧ D.aliasingControl

theorem dns_resolution_criterion_closed_from_evidence
    {N : NavierStokesScalesPackage} {G : FilteredNSGovernor N}
    {S : SGSModelClosure G} {E : EnergyBudgetBalance S}
    {L : LESConvergenceRate E} (D : DNSResolutionCriterion L)
    (Ev : DNSResolutionCriterionEvidence D) : DNSResolutionCriterionClosed D := by
  exact And.intro Ev.resolutionConditionClosed
    (And.intro Ev.nyquistCriterionClosed Ev.aliasingControlClosed)

end DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean
end HautevilleHouse