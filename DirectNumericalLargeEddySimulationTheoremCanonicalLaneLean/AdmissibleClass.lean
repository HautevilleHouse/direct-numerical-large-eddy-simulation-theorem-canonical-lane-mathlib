import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean.TheoremStatement
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure LESSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure LESAdmittedObject where
  space : LESSpace
  navierStokesValid : Prop
  filteredEquationValid : Prop
  closureModelAdmissible : Prop
  convergenceGoal : Prop
  conclusion : convergenceGoal

def LESWitnessClosed (O : LESAdmittedObject) : Prop :=
  O.convergenceGoal

structure AdmissibleClass where
  object : LESAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  LESWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean
end HautevilleHouse