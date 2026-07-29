import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean

structure LESAdmittedObject where
  meshResolution : Prop
  numericalScheme : Prop
  subgridModel : Prop
  filteredSolution : Prop
  conclusion : filteredSolution

def LESWitnessClosed (O : LESAdmittedObject) : Prop :=
  O.filteredSolution

structure LESAdmissibleClass where
  object : LESAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

end DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean
end HautevilleHouse
