
class ProgressionManager {
  static int level = 1;
  static int experience = 0;
  static int nextLevelExp = 1000;
  static int budgetReduction = 0;
  static int qualityBonus = 0;

  static void gainExperience(int exp) {
    experience += exp;
    if (experience >= nextLevelExp) {
      levelUp();
    }
  }

  static void levelUp() {
    level++;
    experience = 0;
    nextLevelExp *= 2;
    if (budgetReduction < 500000) budgetReduction += 50000;
    if (qualityBonus < 20) qualityBonus += 2;
  }

  static BudgetQuality applyBonuses(int budget, int quality) {
    return BudgetQuality(budget - budgetReduction, quality + qualityBonus);
  }
}

class BudgetQuality {
  final int budget;
  final int quality;

  BudgetQuality(this.budget, this.quality);
}
    