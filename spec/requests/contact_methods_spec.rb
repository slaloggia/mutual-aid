 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/contact_methods", type: :request do
  # ContactMethod. As you add validations to ContactMethod, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      ContactMethod.create! valid_attributes
      get contact_methods_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      contact_method = ContactMethod.create! valid_attributes
      get contact_method_url(contact_method)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_contact_method_url
      skip # TODO
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      contact_method = ContactMethod.create! valid_attributes
      get edit_contact_method_url(contact_method)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new ContactMethod" do
        expect {
          post contact_methods_url, params: { contact_method: valid_attributes }
        }.to change(ContactMethod, :count).by(1)
      end

      it "redirects to the created contact_method" do
        post contact_methods_url, params: { contact_method: valid_attributes }
        expect(response).to redirect_to(contact_method_url(ContactMethod.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new ContactMethod" do
        expect {
          post contact_methods_url, params: { contact_method: invalid_attributes }
        }.to change(ContactMethod, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post contact_methods_url, params: { contact_method: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested contact_method" do
        contact_method = ContactMethod.create! valid_attributes
        patch contact_method_url(contact_method), params: { contact_method: new_attributes }
        contact_method.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the contact_method" do
        contact_method = ContactMethod.create! valid_attributes
        patch contact_method_url(contact_method), params: { contact_method: new_attributes }
        contact_method.reload
        expect(response).to redirect_to(contact_method_url(contact_method))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        contact_method = ContactMethod.create! valid_attributes
        patch contact_method_url(contact_method), params: { contact_method: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested contact_method" do
      contact_method = ContactMethod.create! valid_attributes
      expect {
        delete contact_method_url(contact_method)
      }.to change(ContactMethod, :count).by(-1)
    end

    it "redirects to the contact_methods list" do
      contact_method = ContactMethod.create! valid_attributes
      delete contact_method_url(contact_method)
      expect(response).to redirect_to(contact_methods_url)
    end
  end
end
