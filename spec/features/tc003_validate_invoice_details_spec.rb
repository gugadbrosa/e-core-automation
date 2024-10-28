# frozen_string_literal: true

require 'playwright'

RSpec.describe 'TC003 - Validate Invoice Details', type: :feature do
  let(:test_data) do
    {
      username: 'demouser',
      password: 'abc123',
      hotelName: 'Rendezvous Hotel',
      invoiceDate: '14/01/2018',
      dueDate: '15/01/2018',
      invoiceNumber: '110',
      bookingCode: '0875',
      customerDetails: [
        'JOHNY SMITH',
        'R2, AVENUE DU MAROC',
        '123456'
      ],
      room: 'Superior Double',
      checkIn: '14/01/2018',
      checkOut: '15/01/2018',
      totalStayCount: '1',
      totalStayAmount: '$150',
      depositNow: 'USD $20.90',
      taxVat: 'USD $19.00',
      totalAmount: 'USD $209.00'
    }
  end

  before(:each) do
    @page.goto('https://automation-sandbox-python-mpywqjbdza-uc.a.run.app')
  end

  it 'validates invoice details' do
    login('demouser', 'abc123')

    new_tab = @page.expect_popup do
      @page.click('a:has-text("Invoice Details") >> nth=0')
    end

    new_tab.wait_for_load_state
    expected_url = 'https://automation-sandbox-python-mpywqjbdza-uc.a.run.app/invoice/0'
    expect(new_tab.url).to eq(expected_url)

    # On this block of the code I'm not being consistent using CSS selectors or Xpath to show that we can use both on this situation. Most of times CSS selectors can be optimal aganist Xpath, but personally I prefer to go inside the code and add data-test-ids avoind possible breaks with changes on DOM.

    aggregate_failures do
      expect(new_tab.inner_text('h4')).to eq(test_data[:hotelName])
      expect(new_tab.locator('ul li:has(span:has-text("Invoice Date:"))')).to have_text(test_data[:invoiceDate])
      expect(new_tab.locator('ul li:has(span:has-text("Due Date:"))')).to have_text(test_data[:dueDate])
      expect(new_tab.inner_text('h6')).to eq("Invoice ##{test_data[:invoiceNumber]} details")
      expect(new_tab.inner_text('//table[1]/tbody/tr[1]/td[2]')).to eq(test_data[:bookingCode])
      expect(new_tab.inner_text('div')).to include(*test_data[:customerDetails])
      expect(new_tab.inner_text('//table[1]/tbody/tr[2]/td[2]')).to eq(test_data[:room])
      expect(new_tab.inner_text('//section/div/table[1]/tbody/tr[5]/td[2]')).to eq(test_data[:checkIn])
      expect(new_tab.inner_text('//table[1]/tbody/tr[6]/td[2]')).to eq(test_data[:checkOut])
      expect(new_tab.inner_text('//table[1]/tbody/tr[3]/td[2]')).to eq(test_data[:totalStayCount])
      expect(new_tab.inner_text('//table[1]/tbody/tr[4]/td[2]')).to eq(test_data[:totalStayAmount])
      expect(new_tab.inner_text('//table[2]/tbody/tr/td[1]')).to eq(test_data[:depositNow])
      expect(new_tab.inner_text('//table[2]/tbody/tr/td[2]')).to eq(test_data[:taxVat])
      expect(new_tab.inner_text('//table[2]/tbody/tr/td[3]')).to eq(test_data[:totalAmount])
    end
  end
end
