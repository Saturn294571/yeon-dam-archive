**(주제): 공분산 (Covariance)**
- **핵심 공식/정의:** $COV(X,Y) = E[(X-\mu_x)(Y-\mu_y)]$,     $\hat{COV}(X,Y) = \frac{1}{n-1}S_{xy}$
- **핵심 의미/필요성:** 두 변수가 함께 어떻게 변하는지? 관계의 방향성을 나타내는 척도.
- **핵심 키워드:** `기댓값(E)`, `편차`, `방향성`, $S_{xy}$

---
**(주제): 상관계수 (Correlation Coefficient)**
- **핵심 공식/정의:** $\rho=\frac{COV(X,Y)}{\sigma_X\sigma_Y}$
- **핵심 의미/필요성:** 공분산을 표준화, 두 변수 간 **선형 관계**의 방향과 강도를 -1과 1 사이의 값으로 측정하기 위함.
- **핵심 키워드:** `공분산(Covariance)`, `표준편차(σ)`, `선형 관계`, `표준화`

---
**(주제): 표본 피어슨 상관계수 (Sample Pearson's Correlation Coefficient)**
- **핵심 공식/정의:** $r=\frac{S_{xy}}{\sqrt{S_{xx}S_{yy}}}$
- **핵심 의미/필요성:** 표본 데이터를 사용하여 모집단의 피어슨 상관계수(ρ)를 추정하는 통계량.
- **핵심 키워드:** `$S_{xx}$`, `$S_{yy}$`, `$S_{xy}$`, `표본(Sample)`

---
**(주제): 스피어만 순위 상관계수 (Spearman's Rank Correlation Coefficient)**
- **핵심 공식/정의:** $\hat{r}_s=\frac{\text{COV}(R_X,R_Y)}{\sigma_{R_{X}}\sigma_{R_{Y}}}$
- **핵심 의미/필요성:** 데이터의 실제 값이 아닌 순위(Rank)를 이용하여 두 변수 간 단조 관계(monotonic relationship)의 강도를 측정.
- **핵심 키워드:** `순위(Rank)`, `단조 관계`, `비선형`, `이상치에 강함`

---
**(주제): 켄달의 타우 (Kendall's Tau)**
- **핵심 공식/정의:** $\tau=\frac{(\text{Concordant 쌍의 수}) - (\text{Discordant 쌍의 수})}{\binom{n}{2}}$
- **핵심 의미/필요성:** 모든 데이터 쌍의 순서 일치 여부(Concordant/Discordant)를 기반으로 두 변수 간 순서 관계의 강도를 측정.
- **핵심 키워드:** `Concordant pair`, `Discordant pair`, `순서 관계`, `표본 크기가 작을 때`

---
**(주제): 단순 선형 회귀 모델 (Simple Linear Regression Model)**
- **핵심 공식/정의:** $Y_i = \beta_0 + \beta_1 X_i + \epsilon_i \quad \text{where } \epsilon_i \sim N(0, \sigma^2) \text{ and are iid.}$
- **핵심 의미/필요성:** 하나의 독립변수(X)를 이용해 종속변수(Y)의 움직임을 설명하고 예측하는 직선 관계를 모델링.
- **핵심 키워드:** `회귀식`, `오차항(error term)`, `iid`, `절편(intercept)`, `기울기(slope)`

---
**(주제): 모델 적합 (Fitting the Model)**
- **핵심 공식/정의:** $\min \sum_{i=1}^n (Y_i - (\beta_0 + \beta_1 X_i))^2$
- **핵심 의미/필요성:** 잔차(실제값-예측값)의 제곱합(SSE)을 최소화하는 회귀계수($\hat{\beta}_0, \hat{\beta}_1$)를 찾는 과정.
- **핵심 키워드:** `최소제곱법(Least Squares Method)`, `잔차제곱합(SSE)`, `손실 함수(Loss function)`, `편미분`
---
**벡터 미분 (Vector Differentiation)**
- **핵심 공식/정의:** $\frac{\partial (\mathbf{x}^{\intercal}A\mathbf{x})}{\partial \mathbf{x}} = (A+A^{\intercal})\mathbf{x}$
- **핵심 의미/필요성:** 스칼라/벡터 함수를 벡터 변수로 미분 → 그래디언트(gradient)를 행렬 형태로 표현 → LSE 유도에 사용.
- **핵심 키워드:** `그래디언트(Gradient)`, `이차형식(Quadratic Form)`, `전치(Transpose)`, `대칭행렬(Symmetric Matrix)`
---
**이차형식 (Quadratic Form)**
- **핵심 공식/정의:** $\mathbf{x}^{\intercal}A\mathbf{x} = \sum_{i=1}^n \sum_{j=1}^n a_{ij}x_i x_j$
- **핵심 의미/필요성:** 변수들의 제곱항($x_i^2$) + 교차곱항($x_i x_j$)으로 구성된 다변수 2차 다항식 → 벡터/행렬 곱으로 표현.
- **핵심 키워드:** `제곱항`, `교차곱항`, `다변수 2차 다항식`
---
**최소제곱추정량 (LSE) 유도**
- **핵심 공식/정의:** $\hat{\mathbf{\beta}} = (\mathcal{X}^{\intercal}\mathcal{X})^{-1}\mathcal{X}^{\intercal}\mathbf{y}$
- **핵심 의미/필요성:** 잔차제곱합 $SSE = (\mathbf{y} - \mathcal{X}\mathbf{\beta})^{\intercal}(\mathbf{y} - \mathcal{X}\mathbf{\beta})$ → $\mathbf{\beta}$에 대해 미분 후 0으로 놓고 품 → 정규방정식($\mathcal{X}^{\intercal}\mathcal{X}\mathbf{\beta} = \mathcal{X}^{\intercal}\mathbf{y}$) 해 구하기.
- **핵심 키워드:** `잔차제곱합(SSE)`, `정규방정식(Normal Equation)`, `역행렬(Inverse)`, `Full rank(nonsingular)`
---
**LSE의 특성 (Properties of LSE)**
- **핵심 공식/정의:** $\sum e_i = 0, \quad \sum x_i e_i = 0, \quad \sum \hat{y}_i e_i = 0$
- **핵심 의미/필요성:** SSE를 각 계수로 편미분=0 조건 → 잔차($e_i$) 벡터가 상수항, 독립변수($x_i$), 예측값($\hat{y}_i$) 벡터와 각각 직교.
- **핵심 키워드:** `잔차(residual)`, `예측값(fitted value)`, `직교성(Orthogonality)`, `편미분`
---
**LSE의 기하학적 의미 (Geometric Meaning of LSE)**
- **핵심 공식/정의:** $\mathbf{e} \perp C(\mathcal{X})$
- **핵심 의미/필요성:** LSE = 관측값 벡터($\mathbf{y}$)를 설계행렬($\mathcal{X}$)의 열공간($C(\mathcal{X})$)에 정사영(projection) → 예측값 $\hat{\mathbf{y}}$ 찾기.
- **핵심 키워드:** `열공간(Column Space)`, `정사영(Orthogonal Projection)`, `직교(Perpendicular)`
---
**$\hat{\beta}_1$의 분포 (Distribution of $\hat{\beta}_1$)**
- **핵심 공식/정의:** $E(\hat{\beta}_1) = \beta_1$
- **핵심 의미/필요성:** $\hat{\beta}_1$은 $Y_i$들의 선형결합($\sum C_i Y_i$) → 기댓값이 모수 $\beta_1$과 같으므로 불편추정량.
- **핵심 키워드:** `선형결합(Linear Combination)`, `불편추정량(Unbiased Estimator)`, $C_i = \frac{x_i - \bar{x}}{S_{xx}}$
---
**가능도 함수와 추정 (Likelihood Function and Estimation)**
- **핵심 공식/정의:** $\hat{\mu}_{MLE} = \arg \max_{\mu} L(\mu)$
- **핵심 의미/필요성:** 결합확률밀도함수 → 모수($\mu$)에 대한 가능도함수로 간주 → 함수값을 최대로 만드는 모수 추정.
- **핵심 키워드:** `확률밀도함수(pdf)`, `결합확률밀도함수(joint pdf)`, `가능도함수(Likelihood function)`, `최대가능도추정량(MLE)`