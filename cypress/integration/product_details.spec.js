describe("Home page", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("Can navigate to the product details page", () => {
    cy.get("[alt='Scented Blade']").click();
    cy.location("pathname").should("eq", "/products/2");
    cy.contains(
      "The Scented Blade is an extremely rare, tall plant and can be found mostly in savannas. It blooms once a year, for 2 weeks."
    );
  });
});
