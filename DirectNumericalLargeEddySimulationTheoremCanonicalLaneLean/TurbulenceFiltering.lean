import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean

structure TurbulenceFilteringPackage where
  filterKernel : Type u
  filterWidth : ℝ
  filteredField : Type v
  commutatorError : Prop
  subgridScaleModel : Prop

structure TurbulenceFilteringEvidence (T : TurbulenceFilteringPackage) where
  filterKernelDefined : True
  filterWidthPositive : T.filterWidth > 0
  commutatorErrorClosed : T.commutatorError
  subgridScaleModelClosed : T.subgridScaleModel

def TurbulenceFilteringClosed (T : TurbulenceFilteringPackage) : Prop :=
  T.filterWidth > 0 ∧ T.commutatorError ∧ T.subgridScaleModel

theorem turbulence_filtering_closed_from_evidence (T : TurbulenceFilteringPackage)
    (E : TurbulenceFilteringEvidence T) : TurbulenceFilteringClosed T :=
  And.intro E.filterWidthPositive (And.intro E.commutatorErrorClosed E.subgridScaleModelClosed)

end DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean
end HautevilleHouse