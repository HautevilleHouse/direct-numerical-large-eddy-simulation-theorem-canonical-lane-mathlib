import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean.NavierStokesScales

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean

structure FilteredNSGovernor {N : NavierStokesScalesPackage} where
  filteredVelocity : ℝ → ℝ → ℝ
  filteredPressure : ℝ → ℝ → ℝ
  residualStressTensor : ℝ → ℝ → ℝ
  closureModel : Prop
  stabilityCondition : Prop

structure FilteredNSGovernorEvidence {N : NavierStokesScalesPackage}
    (G : FilteredNSGovernor N) where
  filteredVelocityClosed : True
  filteredPressureClosed : True
  residualStressTensorClosed : True
  closureModelClosed : G.closureModel
  stabilityConditionClosed : G.stabilityCondition

def FilteredNSGovernorClosed {N : NavierStokesScalesPackage}
    (G : FilteredNSGovernor N) : Prop :=
  G.closureModel ∧ G.stabilityCondition

theorem filtered_ns_governor_closed_from_evidence {N : NavierStokesScalesPackage}
    (G : FilteredNSGovernor N) (E : FilteredNSGovernorEvidence G) :
    FilteredNSGovernorClosed G := by
  exact And.intro E.closureModelClosed E.stabilityConditionClosed

end DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean
end HautevilleHouse