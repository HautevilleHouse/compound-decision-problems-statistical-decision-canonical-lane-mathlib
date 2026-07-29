import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean

structure ExponentialFamily where
  naturalParameterSpace : Type u
  sufficientStatisticSpace : Type v
  logPartitionFunction : naturalParameterSpace → ℝ
  baseMeasure : Type w
  densityExpression : naturalParameterSpace → sufficientStatisticSpace → ℝ

def ExponentialFamilyClosed (F : ExponentialFamily) : Prop :=
  F.logPartitionFunctionFinite ∧ F.densityExpressionNormalized

theorem exponential_family_closed (F : ExponentialFamily) : ExponentialFamilyClosed F := by
  exact And.intro F.logPartitionFunctionFinite F.densityExpressionNormalized

end CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean
end HautevilleHouse
