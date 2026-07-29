import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean

structure LESConvergence where
  gridConvergence : Prop
  modelConsistency : Prop
  resolvability : Prop
  gridConvergenceTerm : gridConvergence
  modelConsistencyTerm : modelConsistency
  resolvabilityTerm : resolvability

structure LESConvergenceEvidence (L : LESConvergence) where
  gridConvergenceClosed : L.gridConvergence
  modelConsistencyClosed : L.modelConsistency
  resolvabilityClosed : L.resolvability

def LESConvergenceClosed (L : LESConvergence) : Prop :=
  L.gridConvergence ∧ L.modelConsistency ∧ L.resolvability

theorem les_convergence_closed_from_evidence (L : LESConvergence)
    (E : LESConvergenceEvidence L) : LESConvergenceClosed L := by
  exact And.intro E.gridConvergenceClosed
    (And.intro E.modelConsistencyClosed E.resolvabilityClosed)

end DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean
end HautevilleHouse