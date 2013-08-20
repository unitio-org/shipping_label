require 'spec_helper'
require 'support/mailers/user_mailer'

describe ShippingLabel do
  describe '.shipping_label' do
    class TestMailer < ActionMailer::Base
      def welcome; end
    end

    it 'should assign given parameters to a class variable' do
      params = {utm_source: 'newsletter', utm_medium: 'email'}

      TestMailer.shipping_label(params)

      expect(TestMailer.shipping_label_class_params).to eq params
    end
  end

  describe UserMailer do
    describe '#welcome' do
      it 'should have link with params set by shipping_label at class level' do
        mailer = UserMailer.welcome

        expect(mailer).to have_body_text 'http://www.example.com/newsletter?utm_medium=email&utm_source=newsletter'
      end

      it 'should have link with params overridden by link_to helper in view' do
        mailer = UserMailer.welcome

        expect(mailer).to have_body_text 'http://www.example.com/newsletter?utm_medium=email&utm_source=overridden'
      end
    end

    describe '#welcome_again' do
      it 'should have analytics link with params taken from instance' do
        mailer = UserMailer.welcome_again

        expect(mailer).to have_body_text 'http://www.example.com/newsletter?utm_medium=email&utm_source=second_newsletter&utm_term=welcome_again'
      end

      it 'should have analytics link with overridden params' do
        mailer = UserMailer.welcome_again

        expect(mailer).to have_body_text 'http://www.example.com/newsletter?utm_medium=email&utm_source=overridden&utm_term=welcome_again'
      end
    end
  end
end
