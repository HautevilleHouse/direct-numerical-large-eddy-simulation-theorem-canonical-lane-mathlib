import canonicalLaneMathlib.AdmissibleClass
import DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean.TurbulenceFiltering

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean

structure NavierStokesFilteredPackage (T : TurbulenceFilteringPackage) where
  continuityEquation : Prop
  momentumEquation : Prop
  subgridStressTensor : Type u
  closureModel : Prop

structure NavierStokesFilteredEvidence {T : TurbulenceFilteringPackage}
    (N : NavierStokesFilteredPackage T) where
  continuityEquationClosed : N.continuityEquation
  momentumEquationClosed : N.momentumEquation
  subgridStressTensorDefined : Nonempty (N.subgridStressTensor)
  closureModelClosed : N.closureModel

def NavierStokesFilteredClosed {T : TurbulenceFilteringPackage}
    (N : NavierStokesFilteredPackage T) : Prop :=
  N.continuityEquation ∧ N.momentumEquation ∧ N.closureModel

theorem navier_stokes_filtered_closed_from_evidence {T : TurbulenceFilteringPackage}
    (N : NavierStokesFilteredPackage T) (E : NavierStokesFilteredEvidence N) :
    NavierStokesFilteredClosed N :=
  And.intro E.continuityEquationClosed
    (And.intro E.momentumEquationClosed E.closureModelClosed)

end DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean
end HautevilleHouse