import canonicalLaneMathlib.AdmissibleClass

/-!
# Resolved Energy Spectrum Package

This module defines the resolved energy spectrum in Large Eddy Simulation.
-/

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean

structure ResolvedEnergySpectrumPackage where
  energySpectrum : Type
  cutoffWaveNumber : Prop
  inertialRangeScaling : Prop
  dissipationRangeScaling : Prop

structure ResolvedEnergySpectrumEvidence (R : ResolvedEnergySpectrumPackage) where
  cutoffWaveNumberClosed : R.cutoffWaveNumber
  inertialRangeScalingClosed : R.inertialRangeScaling
  dissipationRangeScalingClosed : R.dissipationRangeScaling

def ResolvedEnergySpectrumClosed (R : ResolvedEnergySpectrumPackage) : Prop :=
  R.cutoffWaveNumber ∧ R.inertialRangeScaling ∧ R.dissipationRangeScaling

theorem resolved_energy_spectrum_closed_from_evidence (R : ResolvedEnergySpectrumPackage) (E : ResolvedEnergySpectrumEvidence R) :
    ResolvedEnergySpectrumClosed R := by
  exact And.intro E.cutoffWaveNumberClosed
    (And.intro E.inertialRangeScalingClosed E.dissipationRangeScalingClosed)

end DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean
end HautevilleHouse
