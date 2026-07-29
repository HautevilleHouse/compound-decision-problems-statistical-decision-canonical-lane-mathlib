import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  AdmittedObject A.object ∧ A.endpointSatisfied

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact And.intro A.object.conclusion A.gateWitness

end CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean
end HautevilleHouse
