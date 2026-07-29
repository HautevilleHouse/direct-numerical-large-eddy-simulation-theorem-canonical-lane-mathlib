import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean

structure DynamicSmagorinskyPackage where
  germanoIdentity : Prop
  leastSquaresProcedure : Prop
  clippingProcedure : Prop
  dynamicCoefficient : Prop
  eddyViscosity : Prop

structure DynamicSmagorinskyEvidence (D : DynamicSmagorinskyPackage) where
  germanoIdentityClosed : D.germanoIdentity
  leastSquaresProcedureClosed : D.leastSquaresProcedure
  clipppingProcedureClosed : D.clippingProcedure
  dynamicCoefficientClosed : D.dynamicCoefficient
  eddyViscosityClosed : D.eddyViscosity

def DynamicSmagorinskyClosed (D : DynamicSmagorinskyPackage) : Prop :=
  D.germanoIdentity ∧ D.leastSquaresProcedure ∧ D.clippingProcedure ∧
  D.dynamicCoefficient ∧ D.eddyViscosity

theorem dynamic_smagorinsky_closed_from_evidence (D : DynamicSmagorinskyPackage)
    (E : DynamicSmagorinskyEvidence D) : DynamicSmagorinskyClosed D := by
  exact And.intro E.germanoIdentityClosed
    (And.intro E.leastSquaresProcedureClosed
      (And.intro E.clipppingProcedureClosed
        (And.intro E.dynamicCoefficientClosed E.eddyViscosityClosed)))

end DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean
end HautevilleHouse
