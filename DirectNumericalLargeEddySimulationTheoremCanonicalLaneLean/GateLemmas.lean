import HautevilleHouse.DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean
end HautevilleHouse