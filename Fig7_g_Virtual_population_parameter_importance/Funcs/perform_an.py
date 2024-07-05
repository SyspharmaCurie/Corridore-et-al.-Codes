
# -- machine-learning
import shap


def compute_feature_importances_SHAP(regressor,X_train,X_test):
     # Step 5: SHAP for Variable Importance
     explainer = shap.Explainer(regressor, X_train)
     shap_values = explainer.shap_values(X_test)
     return shap_values










