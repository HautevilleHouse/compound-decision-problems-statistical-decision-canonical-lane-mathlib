import CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  constrainedStatement : String
  carriedRemainder : String

def sourceTheoremStatement : TheoremStatement :=
  { sourceKey := "CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean",
    theoremName := "Constrained Compound Decision Closure",
    theoremObject := "admissible-class closure for compound decision problems",
    classicalBoundary := "full statistical decision theory including unrestricted loss functions",
    constrainedStatement := "the constrained closure holds for the admissible class",
    carriedRemainder := "unrestricted classical closure remains external"
  }

end CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean
end HautevilleHouse