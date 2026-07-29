import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean

structure EnergyCascade where
  inertialRange : Prop
  k41Spectrum : Prop
  dissipationAnomaly : Prop
  inertialRangeTerm : inertialRange
  k41SpectrumTerm : k41Spectrum
  dissipationAnomalyTerm : dissipationAnomaly

structure EnergyCascadeEvidence (E : EnergyCascade) where
  inertialRangeClosed : E.inertialRange
  k41SpectrumClosed : E.k41Spectrum
  dissipationAnomalyClosed : E.dissipationAnomaly

def EnergyCascadeClosed (E : EnergyCascade) : Prop :=
  E.inertialRange ∧ E.k41Spectrum ∧ E.dissipationAnomaly

theorem energy_cascade_closed_from_evidence (E : EnergyCascade)
    (Ev : EnergyCascadeEvidence E) : EnergyCascadeClosed E := by
  exact And.intro Ev.inertialRangeClosed
    (And.intro Ev.k41SpectrumClosed Ev.dissipationAnomalyClosed)

end DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean
end HautevilleHouse