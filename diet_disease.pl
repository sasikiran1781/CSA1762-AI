% Base facts for diseases and their dietary recommendations
diet(diabetes, "Low Glycemic Index foods, complex carbohydrates, lean proteins, healthy fats. Avoid sugary drinks and refined carbs.").
diet(hypertension, "Limit sodium, increase potassium and magnesium, low-fat dairy. Follow DASH diet. Avoid processed foods and excessive caffeine.").
diet(heart_disease, "Monounsaturated fats, omega-3 fatty acids, whole grains, and high-fiber foods. Avoid red meat, processed snacks, and baked goods.").
diet(celiac, "Gluten-free diet. Avoid wheat, barley, and rye. Include rice, corn, quinoa, and fresh fruits and vegetables.").
diet(ibs, "Follow a low FODMAP diet. Avoid beans, onions, garlic, and high-fat dairy. Gradually introduce high fiber foods.").
diet(kidney_disease, "Limit protein, control potassium and phosphorus, reduce sodium intake. Include low-potassium vegetables and non-processed meats.").
diet(obesity, "Calorie control, high-protein foods, high-fiber vegetables. Avoid sugary drinks, fast food, and high-fat processed foods.").
diet(cancer, "High-protein foods, fruits, vegetables, and hydration. Avoid highly processed foods and excessive alcohol.").
diet(gout, "Low purine foods, avoid red meat, shellfish, and organ meats. Drink plenty of water. Include cherries and low-fat dairy.").
diet(liver_disease, "Low-sodium, high-protein foods. Avoid alcohol, high-fat foods, and processed foods. Include whole grains and leafy greens.").

% Query to provide dietary advice based on the disease
suggest_diet(Disease, Advice) :-
    diet(Disease, Advice).

% Example query
% ?- suggest_diet(diabetes, Advice).
