import HautevilleHouse.DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  LESWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean
end HautevilleHouse