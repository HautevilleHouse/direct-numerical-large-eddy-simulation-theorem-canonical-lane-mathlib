import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean

structure BoussinesqApproximationPackage where
  constantDensity : Prop
  densityVariationsSmall : Prop
  buoyancyForce : Prop
  filteredEquations : Prop

structure BoussinesqApproximationEvidence (B : BoussinesqApproximationPackage) where
  constantDensityClosed : B.constantDensity
  densityVariationsSmallClosed : B.densityVariationsSmall
  buoyancyForceClosed : B.buoyancyForce
  filteredEquationsClosed : B.filteredEquations

def BoussinesqApproximationClosed (B : BoussinesqApproximationPackage) : Prop :=
  B.constantDensity ∧ B.densityVariationsSmall ∧ B.buoyancyForce ∧ B.filteredEquations

theorem boussinesq_approximation_closed_from_evidence (B : BoussinesqApproximationPackage)
    (E : BoussinesqApproximationEvidence B) : BoussinesqApproximationClosed B := by
  exact And.intro E.constantDensityClosed
    (And.intro E.densityVariationsSmallClosed
      (And.intro E.buoyancyForceClosed E.filteredEquationsClosed))

end DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean
end HautevilleHouse
