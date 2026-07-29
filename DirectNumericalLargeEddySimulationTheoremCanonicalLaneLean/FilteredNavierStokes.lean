import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean

structure FilteredNavierStokesPackage where
  filterKernel : Type u
  commutationError : Prop
  subgridScaleTensor : Prop
  filteredContinuity : Prop
  filteredMomentum : Prop

structure FilteredNavierStokesEvidence (F : FilteredNavierStokesPackage) where
  filterKernelDefined : Type u
  commutationErrorClosed : F.commutationError
  subgridScaleTensorClosed : F.subgridScaleTensor
  filteredContinuityClosed : F.filteredContinuity
  filteredMomentumClosed : F.filteredMomentum

def FilteredNavierStokesClosed (F : FilteredNavierStokesPackage) : Prop :=
  F.commutationError ∧ F.subgridScaleTensor ∧ F.filteredContinuity ∧ F.filteredMomentum

theorem filtered_navier_stokes_closed_from_evidence (F : FilteredNavierStokesPackage)
    (E : FilteredNavierStokesEvidence F) : FilteredNavierStokesClosed F := by
  exact And.intro E.commutationErrorClosed
    (And.intro E.subgridScaleTensorClosed
      (And.intro E.filteredContinuityClosed E.filteredMomentumClosed))

end DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean
end HautevilleHouse
