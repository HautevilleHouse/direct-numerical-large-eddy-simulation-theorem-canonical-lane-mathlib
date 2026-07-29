import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean.FilteredNSGovernor

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean

structure SGSModelClosure {N : NavierStokesScalesPackage}
    {G : FilteredNSGovernor N} where
  eddyViscosityModel : Prop
  dynamicSmagorinsky : Prop
  scaleSimilarityPart : Prop
  mixedModel : Prop
  wallDampingFunction : Prop

structure SGSModelClosureEvidence {N : NavierStokesScalesPackage}
    {G : FilteredNSGovernor N} (S : SGSModelClosure G) where
  eddyViscosityModelClosed : S.eddyViscosityModel
  dynamicSmagorinskyClosed : S.dynamicSmagorinsky
  scaleSimilarityPartClosed : S.scaleSimilarityPart
  mixedModelClosed : S.mixedModel
  wallDampingFunctionClosed : S.wallDampingFunction

def SGSModelClosureClosed {N : NavierStokesScalesPackage}
    {G : FilteredNSGovernor N} (S : SGSModelClosure G) : Prop :=
  S.eddyViscosityModel ∧ S.dynamicSmagorinsky ∧
  S.scaleSimilarityPart ∧ S.mixedModel ∧ S.wallDampingFunction

theorem sgs_model_closure_closed_from_evidence {N : NavierStokesScalesPackage}
    {G : FilteredNSGovernor N} (S : SGSModelClosure G)
    (E : SGSModelClosureEvidence S) : SGSModelClosureClosed S := by
  exact And.intro E.eddyViscosityModelClosed
    (And.intro E.dynamicSmagorinskyClosed
      (And.intro E.scaleSimilarityPartClosed
        (And.intro E.mixedModelClosed E.wallDampingFunctionClosed)))

end DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean
end HautevilleHouse