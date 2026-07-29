import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean

def ConstrainedCompoundDecisionClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_compound_decision_endgame (A : AdmissibleClass) :
    ConstrainedCompoundDecisionClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean
end HautevilleHouse
