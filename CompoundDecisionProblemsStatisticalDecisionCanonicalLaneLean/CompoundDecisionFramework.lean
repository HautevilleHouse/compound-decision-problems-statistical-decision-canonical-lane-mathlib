import canonicalLaneMathlib.AdmissibleClass
import CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean.SufficiencyPackage
import CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean.ExponentialFamily
import CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean.NeymanPearsonLemma
import CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean.MLEConsistency

namespace HautevilleHouse
namespace CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean

structure CompoundDecisionFramework where
  componentProblems : Type u
  jointRiskFunction : Type v
  shrinkageOrEmpiricalBayes : Prop
  optimalCombinationRule : Prop
  asymptoticProperties : Prop

structure CompoundDecisionFrameworkEvidence (C : CompoundDecisionFramework) where
  shrinkageOrEmpiricalBayesClosed : C.shrinkageOrEmpiricalBayes
  optimalCombinationRuleClosed : C.optimalCombinationRule
  asymptoticPropertiesClosed : C.asymptoticProperties

def CompoundDecisionFrameworkClosed (C : CompoundDecisionFramework) : Prop :=
  C.shrinkageOrEmpiricalBayes ∧ C.optimalCombinationRule ∧ C.asymptoticProperties

theorem compound_decision_framework_closed_from_evidence (C : CompoundDecisionFramework) (E : CompoundDecisionFrameworkEvidence C) :
    CompoundDecisionFrameworkClosed C := by
  exact And.intro E.shrinkageOrEmpiricalBayesClosed
    (And.intro E.optimalCombinationRuleClosed E.asymptoticPropertiesClosed)

end CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean
end HautevilleHouse