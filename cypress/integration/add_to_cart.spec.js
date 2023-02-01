describe("Add to cart button", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("Can add a product to the cart", () => {
    cy.contains("Add").click({ force: true });
    cy.contains(".end-0", "My Cart (1)");
  });
});
