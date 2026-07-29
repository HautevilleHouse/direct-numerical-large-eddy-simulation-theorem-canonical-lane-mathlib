import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean.DNSResolutionCriterion

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean

def ConstrainedDirectNumericalLESClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_direct_numerical_les_endgame (A : AdmissibleClass) :
    ConstrainedDirectNumericalLESClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean
end HautevilleHouse