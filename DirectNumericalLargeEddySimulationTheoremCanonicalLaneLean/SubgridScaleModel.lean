import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean

structure SubgridScaleModel where
  smagorinskyModel : Prop
  dynamicModel : Prop
  scaleSimilarityModel : Prop
  mixedModel : Prop
  smagorinskyModelTerm : smagorinskyModel
  dynamicModelTerm : dynamicModel
  scaleSimilarityModelTerm : scaleSimilarityModel
  mixedModelTerm : mixedModel

structure SubgridScaleModelEvidence (S : SubgridScaleModel) where
  smagorinskyModelClosed : S.smagorinskyModel
  dynamicModelClosed : S.dynamicModel
  scaleSimilarityModelClosed : S.scaleSimilarityModel
  mixedModelClosed : S.mixedModel

def SubgridScaleModelClosed (S : SubgridScaleModel) : Prop :=
  S.smagorinskyModel ∧ S.dynamicModel ∧ S.scaleSimilarityModel ∧ S.mixedModel

theorem subgrid_scale_model_closed_from_evidence (S : SubgridScaleModel)
    (E : SubgridScaleModelEvidence S) : SubgridScaleModelClosed S := by
  exact And.intro E.smagorinskyModelClosed
    (And.intro E.dynamicModelClosed
      (And.intro E.scaleSimilarityModelClosed E.mixedModelClosed))

end DirectNumericalLargeEddySimulationTheoremCanonicalLaneLean
end HautevilleHouse