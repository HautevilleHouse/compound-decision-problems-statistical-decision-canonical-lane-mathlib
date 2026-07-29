import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean

structure NeymanPearsonHypothesis where
  nullDistribution : Type u
  alternativeDistribution : Type v
  testFunction : samplespace → ℝ
  size : ℝ
  power : ℝ

def NeymanPearsonClosed (H : NeymanPearsonHypothesis) : Prop :=
  H.testRegionMeasurable ∧ H.sizeControlled ∧ H.powerMaximized

theorem neyman_pearson_closed (H : NeymanPearsonHypothesis) : NeymanPearsonClosed H := by
  exact And.intro H.testRegionMeasurable (And.intro H.sizeControlled H.powerMaximized)

end CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean
end HautevilleHouse
