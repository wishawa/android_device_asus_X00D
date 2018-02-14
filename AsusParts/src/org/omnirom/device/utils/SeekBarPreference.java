/*
 *  Copyright (C) 2013 The OmniROM Project
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */
package org.omnirom.device.utils;

import android.content.Context;
import android.content.res.TypedArray;
import android.preference.Preference;
import android.text.InputFilter;
import android.text.InputType;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.View;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.SeekBar;
import android.widget.SeekBar.OnSeekBarChangeListener;
import android.widget.TextView;

import org.omnirom.device.R;

public class SeekBarPreference extends Preference {

    public static int maximum = 256;
    public static int interval = 1;

    int currentValue = 256;

    private OnPreferenceChangeListener changer;

    public SeekBarPreference(Context context, AttributeSet attrs) {
        super(context, attrs, 0);
    }

    @Override
    public void setEnabled(boolean enabled) {
        super.setEnabled(enabled);
    }

    private void bind(final View layout) {
        final EditText monitorBox = (EditText) layout.findViewById(R.id.monitor_box);
        final SeekBar bar = (SeekBar) layout.findViewById(R.id.seek_bar);

        monitorBox.setInputType(InputType.TYPE_CLASS_NUMBER);

        bar.setProgress(currentValue);
        bar.setMax(maximum);

        monitorBox.setText(String.valueOf(currentValue));
        monitorBox.setOnFocusChangeListener(new View.OnFocusChangeListener() {
            @Override
            public void onFocusChange(View v, boolean hasFocus) {
                if (hasFocus)
                    monitorBox.setSelection(monitorBox.getText().length());
            }
        });
        monitorBox.setFilters(new InputFilter[]{new InputFilterMinMax(0, maximum)});
        monitorBox.setOnEditorActionListener(new TextView.OnEditorActionListener() {
            @Override
            public boolean onEditorAction(TextView v, int keyCode, KeyEvent event) {
                if (keyCode == EditorInfo.IME_ACTION_DONE) {
                    v.clearFocus();
                    InputMethodManager imm = (InputMethodManager) getContext().getSystemService(Context.INPUT_METHOD_SERVICE);
                    imm.hideSoftInputFromWindow(v.getWindowToken(), 0);
                    currentValue = Integer.parseInt(v.getText().toString());
                    bar.setProgress(currentValue, true);
                    changer.onPreferenceChange(SeekBarPreference.this, Integer.toString(currentValue));
                    return true;
                }
                return false;
            }
        });

        bar.setOnSeekBarChangeListener(new OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                progress = Math.round(((float) progress) / interval) * interval;
                currentValue = progress;
                monitorBox.setText(String.valueOf(progress));
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {

            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {
                changer.onPreferenceChange(SeekBarPreference.this, Integer.toString(currentValue));
            }
        });
    }

    @Override
    protected void onBindView(View view) {
        super.onBindView(view);
        bind(view);
    }

    public void setInitValue(int progress) {
        currentValue = progress;
    }

    @Override
    protected Object onGetDefaultValue(TypedArray a, int index) {
        // TODO Auto-generated method stub
        return super.onGetDefaultValue(a, index);
    }

    @Override
    public void setOnPreferenceChangeListener(OnPreferenceChangeListener onPreferenceChangeListener) {
        changer = onPreferenceChangeListener;
        super.setOnPreferenceChangeListener(onPreferenceChangeListener);
    }
}
