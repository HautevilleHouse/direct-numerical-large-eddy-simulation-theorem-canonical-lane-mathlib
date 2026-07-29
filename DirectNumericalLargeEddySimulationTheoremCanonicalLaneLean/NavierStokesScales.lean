import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean

structure NavierStokesScalesPackage where
  reynoldsNumber : ℝ
  kolmogorovScale : ℝ
  integralScale : ℝ
  taylorScale : ℝ
  filterWidth : ℝ

structure NavierStokesScalesEvidence (N : NavierStokesScalesPackage) where
  reynoldsNumberClosed : N.reynoldsNumber > 0
  kolmogorovScaleClosed : N.kolmogorovScale > 0
  integralScaleClosed : N.integralScale > 0
  taylorScaleClosed : N.taylorScale > 0
  filterWidthClosed : N.filterWidth > 0

def NavierStokesScalesClosed (N : NavierStokesScalesPackage) : Prop :=
  N.reynoldsNumber > 0 ∧ N.kolmogorovScale > 0 ∧
  N.integralScale > 0 ∧ N.taylorScale > 0 ∧ N.filterWidth > 0

theorem navier_stokes_scales_closed_from_evidence (N : NavierStokesScalesPackage)
    (E : NavierStokesScalesEvidence N) : NavierStokesScalesClosed N := by
  exact And.intro E.reynoldsNumberClosed
    (And.intro E.kolmogorovScaleClosed
      (And.intro E.integralScaleClosed
        (And.intro E.taylorScaleClosed E.filterWidthClosed)))

end DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean
end HautevilleHouse